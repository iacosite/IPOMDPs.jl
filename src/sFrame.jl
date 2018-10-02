struct sModel{W} <: Model
    index::Int64
    belief::AbstractVector{W}
end

struct sFrameData{S,A,W} <: FrameData
    id::Int64
    ipomdp::IPOMDP{S}
    agent::Agent{S,A,W}
    frame::sFrame{S,A,W}
    k::Int64
    updater::KMarkovUpdater
end

function frameData(ipomdp::IPOMDP{S}, agent::Agent{S,A,W}, frame::sFrame{S,A,W}) where {S,A,W}
    id = IPOMDPs.frameindex(ipomdp, agent, frame)
    k = 5 # Defined action history length
    updater = BeliefUpdaters.KMarkovUpdater(k)

    return sFrameData(id, ipomdp, agent, frame, updater)
end

function frameModel(data::sFrameData{S,A,W}) where {S,A,W}
    return pomdpModel(data.id, IPOMDPs.initial_belief(data))
end

function initial_belief(data::sFrameData{S,A,W}) where {S,A,W}
    allObs = IPOMDPs.observations(data.ipomdp, data.agent)
    obs = Vector{W}()
    obs = fill(allObs[rand(1:end)], data.k)
    belief = BeliefUpdaters.initialize_belief(data.updater, obs)

    return belief
end

function action(model::sModel{W}, data::sFrameData{S,A,W}) where {S,A,W}
    allActions = IPOMDPs.actions(data.ipomdp, data.agent)

    return allActions[rand(1:end)]
end

function update(model::sModel{W}, data::sFrameData{S,A,W}, action::A, observation::W) where {S,A,W}

    return BeliefUpdaters.update(data.updater, model.belief, action, observation)
end
