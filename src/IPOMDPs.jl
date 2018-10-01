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
    agents,
    frames,
    actions,
    observations,
    transition,
    rewards,

    # Initial distributions
    initial_state_distribution,
    initial_frame_distribution

    include("ipomdp.jl")
end
