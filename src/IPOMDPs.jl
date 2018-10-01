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
    initialstate_distribution,
    initialframe_distribution

    include("ipomdp.jl")
end
