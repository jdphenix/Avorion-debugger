local dbg = include("debugger")

-- namespace AutoscalerPlayer
AutoscalerPlayer = {}
AutoscalerPlayer.testValue = 0

function AutoscalerPlayer.invokedFunction(invokedFunctionArg1)
    dbg() -- always break
end

function AutoscalerPlayer.invokedFunctionConditionalDebug(invokedFunctionArg2)
    local see, me, printed = {3, 4, 5}, {6, 7, 8}, {"Avorion", "is", "awesome"}
    dbg(invokedFunctionArg2.testValue < 75) -- breakpoint if false
end

function AutoscalerPlayer.getUpdateInterval() 
    return 10
end

function AutoscalerPlayer.secure()
    local save = {}
    
    save.testValue = AutoscalerPlayer.testValue
    Player():sendChatMessage("", 1, "Saving test value.")

    AutoscalerPlayer.invokedFunction(save)
    AutoscalerPlayer.invokedFunctionConditionalDebug(save)

    return save
end

function AutoscalerPlayer.restore(values)
    AutoscalerPlayer.testValue = values.testValue
end

function AutoscalerPlayer.updateServer(timeStep)
    AutoscalerPlayer.testValue = AutoscalerPlayer.testValue + 1
end

return AutoscalerPlayer