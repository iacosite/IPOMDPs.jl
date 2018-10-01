module IPOMDPs

export
    # Abstract types
    IPOMDP,
    Agent,
    Frame,
    IntentionalFrame,
    SubintentionalFrame,

    # Standard defined models
    ipomdpFrame,
    pomdpFrame,
    sFrame,

    # Functions
    states,
    stateindex,
    n_states,
    actions,
    actionindex,
    n_actions,
    observations,
    observationindex,
    n_observations,
    agents,
    agentindex,
    n_agents,
    frames,
    frameindex,
    n_frames,
    transition,
    observation,
    reward,

    # Initial distributions
    initialstate_distribution,
    initialframe_distribution

    include("ipomdp.jl")
end
