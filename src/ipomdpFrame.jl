struct ipomdpModel <: Model
    index::Int64
    belief::iBelief
end

struct ipomdpFrameData{S,A,W} <: FrameData
    id::Int64
    frame::POMDP{S,A,W}
    policy::ReductionPolicy{S}
    updater::InteractiveBeliefUpdater{S}
end

function frameData(ipomdp::IPOMDP{S}, agent::Agent{S,A,W}, frame::ipomdpFrame{S,A,W}) where {S,A,W}
end

function frameModel(data::ipomdpFrameData{S,A,W}) where {S,A,W}
end

function initial_belief(data::ipomdpFrameData{S,A,W}) where {S,A,W}
end

function action(model::ipomdpModel, data::ipomdpFrameData{S,A,W}) where {S,A,W}
end

function update(model::ipomdpModel, data::ipomdpFrameData{S,A,W}, action::A, observation::W) where {S,A,W}
end
