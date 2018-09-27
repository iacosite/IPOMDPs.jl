using IPOMDPs
# Find element X in the array V
function find(V::Vector{Agent}, X::Agent)
    for (i,e) in enumerate(X)
        if(e == X)
            return i
        end
    end
    return -1
end

function find(V::Vector{Model}, X::Model)
    for (i,e) in enumerate(X)
        if(e == X)
            return i
        end
    end
    return -1
end
