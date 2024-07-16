classdef (Enumeration) EngineState < Simulink.IntEnumType
  enumeration
    StartEngine(0)
    EngineRunning(1)
    EngineStalled(2)
    default(3)
    
  end
end 