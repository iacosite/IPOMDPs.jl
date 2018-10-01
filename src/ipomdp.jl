# NOTE: sp = State Produced = resulting state
#	s = starting state
#=
 = Type Hierarchy
 =#
abstract type IPOMDP{S} end

abstract type Agent{S,A,W} <: IPOMDP{S} end

abstract type Frame{S,A,W} <: Agent{S,A,W} end

abstract type IntentionalFrame{S,A,W} <: Frame{S,A,W} end
abstract type SubintentionalFrame{S,A,W} <: Frame{S,A,W} end

abstract type ipomdpFrame{S,A,W} <: IntentionalFrame{S,A,W} end
abstract type pomdpFrame{S,A,W} <: IntentionalFrame{S,A,W} end
abstract type sFrame{S,A,W} <: SubintentionalFrame{S,A,W} end

#=
 =Framework functions
 =#
"""
    discount(ipomdp::IPOMDP{S})
"""
function discount end

"""
    states{S}(ipomdp::IPOMDP{S})
"""
function states end

"""
    n_states(problem::IPOMDP{S})
"""
# Automatically defined
function n_states(problem::IPOMDP)
    return size(states(problem), 1)
end

"""
    state_index(problem::IPOMDP{S}, s::S)
"""
function state_index end

"""
    agents(ipomdp::IPOMDP{S})
    agents(ipomdp::IPOMDP{S}, frame::ipomdpFrame{S,A,W})
"""
function agents end

"""
    n_agents(problem::IPOMDP{S})
    n_agents(problem::IPOMDP{S}, frame::ipomdpFrame{S,A,W})
"""
# Automatically defined
function n_agents(problem::IPOMDP)
    return size(agents(problem), 1)
end
# Automatically defined
function n_agents(problem::IPOMDP, frame::ipomdpFrame)
    return size(agents(problem, frame), 1)
end

"""
    agent_index(problem::IPOMDP{S}, agent::Agent{S,A,W})
    agent_index(problem::IPOMDP{S}, frame::ipomdpFrame{S,A,W}, agent::Agent{S,A,W})
"""
function agent_index end

"""
    actions(ipomdp::IPOMDP{S}, agent::Agent{S,A,W})
"""
function actions end

"""
    n_actions(problem::IPOMDP{S}, agent::Agent{S,A,W})
"""
# Automatically defined
function n_actions(problem::IPOMDP, agent::Agent)
    return size(actions(problem, agent), 1)
end

"""
    action_index(problem::IPOMDP{S}, agent::Agent{S,A,W}, a::A)
"""
function action_index end

"""
    observations(ipomdp::IPOMDP{S}, agent::Agent{S,A,W})
"""
function observations end

"""
    n_observations(problem::IPOMDP{S}, agent::Agent{S,A,W})
"""
# Automatically defined
function n_observations(problem::IPOMDP, agent::Agent)
    return size(observations(problem, agent), 1)
end

"""
    observation_index(problem::IPOMDP{S}, agent::Agent{S,A,W}, o::W)
"""
function observation_index end

"""
    frames(ipomdp::IPOMDP{S}, agent::Agent{S,A,W})
"""
function frames end

"""
    n_frames(problem::IPOMDP{S}, agent::Agent{S,A,W})
"""
# Automatically defined
function n_frames(problem::IPOMDP, agent::Agent)
    return size(frames(problem, agent), 1)
end

"""
    frame_index(ipomdp::IPOMDP{S}, agent::Agent{S,A,W}, frame::Frame{S,A,W})
"""
function frame_index end

# Ti
"""
    transition(ipomdp::IPOMDP{S}, frame::ipomdpFrame{S,A,W}, s::S, a::Vector{A})
    transition(ipomdp::IPOMDP{S}, frame::pomdpFrame{S,A,W}, s::S, a::Vector{A}) (non implemented)
			or
    transition(ipomdp::IPOMDP{S}, frame::pomdpFrame{S,A,W}, s::S, a::A) (currently implemented)
"""
function transition end

# Oi
"""
    observation(ipomdp::IPOMDP{S}, frame::ipomdpFrame{S,A,W}, a::Vector{A}, sp::S)
    observation(ipomdp::IPOMDP{S}, frame::pomdpFrame{S,A,W}, a::Vector{A}, sp::S) (non implemented)
			or
    observation(ipomdp::IPOMDP{S}, frame::pomdpFrame{S,A,W}, a::A, sp::S) (currently implemented)
"""
function observation end

# Ri
"""
    reward(ipomdp::IPOMDP{S}, frame::ipomdpFrame{S,A,W}, s::S, a::Vector{A})
    reward(ipomdp::IPOMDP{S}, frame::pomdpFrame{S,A,W}, s::S, a::Vector{A}) (not implemented)
			or
    reward(ipomdp::IPOMDP{S}, frame::pomdpFrame{S,A,W}, s::S, a::A) (currently implemented)
"""
function reward end

"""
    initial_state_distribution(ipomdp::IPOMDP{S}, frame::ipomdpFrame{S,A,W})
    initial_state_distribution(ipomdp::IPOMDP{S}, frame::pomdpFrame{S,A,W})
"""
function initial_state_distribution end

"""
Specifies the initial likleyhood of each frame for the given agent
    initial_frame_distribution(ipomdp::IPOMDP{S}, agent::Agent{S,A,W})
"""
function initial_frame_distribution end

"""
Specifies wether the reached state is terminal
	isterminal(ipomdp::IPOMDP{S}, s::S)
"""
function isterminal end


