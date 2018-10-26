module IPOMDPs


export
    IPOMDP,
    Model,
    Agent,
    IS,

    agent,
    actions_agent,
    observations_agent,

    model_observation,
    tau,
    actionP,
    action,

    states,
    actions,
    observations,
    observation,
    transition,
    reward,
    discount,

    emulated_frames,
    initialstate_distribution,
    initialframe_distribution
    
    include("ipomdp.jl")
end
