struct pomdpModel <: Model
    index::Int64
    belief::DiscreteBelief
end

struct pomdpFrameData{S,A,W} <: FrameData
    id::Int64
    frame::POMDP{S,A,W}
    policy::POMDPPolicy
    updater::DiscreteUpdater
end

function frameData(ipomdp::IPOMDP{S}, agent::Agent{S,A,W}, frame::pomdpFrame{S,A,W}) where {S,A,W}
    pomdpFrame = IPOMDPToolbox.generatePOMDP(ipomdp, a, f)
    id = IPOMDPs.frameindex(ipomdp, agent, frame)
    policy = SARSOP.POMDPPolicy(pomdpFrame, "$id.policy")
    solver = SARSOP.SARSOPSolver()
    e_policy = POMDPs.solve(solver, pomdpFrame, policy, pomdp_file_name="$id.pomdpx")
    updater = SARSOP.updater(e_policy)

    return pomdpFrameData(id, pomdpFrame, e_policy, updater)
end

function frameModel(data::pomdpFrameData{S,A,W}) where {S,A,W}
    return pomdpModel(data.id, IPOMDPs.initial_belief(data))
end

function initial_belief(data::pomdpFrameData{S,A,W}) where {S,A,W}
    dist = POMDPs.initialstate_distribution(data.pomdp)
    belief = BeliefUpdaters.initializeBelief(data.updater, dist)

    return belief
end

function action(model::pomdpModel, data::pomdpFrameData{S,A,W}) where {S,A,W}
    return POMDPs.action(data.policy, model.belief)
end

function update(model::pomdpModel, data::pomdpFrameData{S,A,W}, action::A, observation::W) where {S,A,W}
    return POMDPs.update(data.updater, model.belief, action, observation)
end
