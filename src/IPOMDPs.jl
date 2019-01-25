module IPOMDPs


export
    IPOMDP,
    Model,
    Agent,
    IS,

    agent,
    actions_agent,
    actionindex_agent,
    observations_agent,
    obsindex_agent,

    model_observation,
    tau,
    actionP,
    action,

    states,
    stateindex,
    actions,
    observations,
    observation,
    transition,
    reward,
    discount,
    isterminal,

    emulated_frames,
    initialstate_distribution,
    initialframe_distribution,
    
    update,
    initialize_belief,
    updater,
    solve
    
    include("ipomdp.jl")
end
