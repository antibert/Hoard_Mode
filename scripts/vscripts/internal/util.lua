function DebugPrint(...)
  local spew = -1
  if spew == -1 and BAREBONES_DEBUG_SPEW then
    spew = 1
  end

  if spew == 1 then
    print(...)
  end
end

function DebugPrintTable(...)
  local spew = -1
  if spew == -1 and BAREBONES_DEBUG_SPEW then
    spew = 1
  end

  if spew == 1 then
    PrintTable(...)
  end
end

function PrintTable(t, indent, done)
  --print ( string.format ('PrintTable type %s', type(keys)) )
  if type(t) ~= "table" then return end

  done = done or {}
  done[t] = true
  indent = indent or 0

  local l = {}
  for k, v in pairs(t) do
    table.insert(l, k)
  end

  table.sort(l)
  for k, v in ipairs(l) do
    -- Ignore FDesc
    if v ~= 'FDesc' then
      local value = t[v]

      if type(value) == "table" and not done[value] then
        done [value] = true
        print(string.rep ("\t", indent)..tostring(v)..":")
        PrintTable (value, indent + 2, done)
      elseif type(value) == "userdata" and not done[value] then
        done [value] = true
        print(string.rep ("\t", indent)..tostring(v)..": "..tostring(value))
        PrintTable ((getmetatable(value) and getmetatable(value).__index) or getmetatable(value), indent + 2, done)
      else
        if t.FDesc and t.FDesc[v] then
          print(string.rep ("\t", indent)..tostring(t.FDesc[v]))
        else
          print(string.rep ("\t", indent)..tostring(v)..": "..tostring(value))
        end
      end
    end
  end
end

-- Colors
COLOR_NONE = '\x06'
COLOR_GRAY = '\x06'
COLOR_GREY = '\x06'
COLOR_GREEN = '\x0C'
COLOR_DPURPLE = '\x0D'
COLOR_SPINK = '\x0E'
COLOR_DYELLOW = '\x10'
COLOR_PINK = '\x11'
COLOR_RED = '\x12'
COLOR_LGREEN = '\x15'
COLOR_BLUE = '\x16'
COLOR_DGREEN = '\x18'
COLOR_SBLUE = '\x19'
COLOR_PURPLE = '\x1A'
COLOR_ORANGE = '\x1B'
COLOR_LRED = '\x1C'
COLOR_GOLD = '\x1D'


--[[Author: Noya
  Date: 09.08.2015.
  Hides all dem hats
]]
function HideWearables( event )
  local hero = event.caster
  local ability = event.ability

  hero.hiddenWearables = {} -- Keep every wearable handle in a table to show them later
    local model = hero:FirstMoveChild()
    while model ~= nil do
        if model:GetClassname() == "dota_item_wearable" then
            model:AddEffects(EF_NODRAW) -- Set model hidden
            table.insert(hero.hiddenWearables, model)
        end
        model = model:NextMovePeer()
    end
end

function ShowWearables( event )
  local hero = event.caster

  for i,v in pairs(hero.hiddenWearables) do
    v:RemoveEffects(EF_NODRAW)
  end
end

-- Adds [stack_amount] stacks to a modifier
function AddStacks(ability, caster, unit, modifier, stack_amount, refresh)
  if unit:HasModifier(modifier) then
    if refresh then
      ability:ApplyDataDrivenModifier(caster, unit, modifier, {})
    end
    unit:SetModifierStackCount(modifier, ability, unit:GetModifierStackCount(modifier, ability) + stack_amount)
  else
    ability:ApplyDataDrivenModifier(caster, unit, modifier, {})
    unit:SetModifierStackCount(modifier, ability, stack_amount)
  end
end

-- From DOTA Imba
-- Rolls a Psuedo Random chance. If failed, chances increases, otherwise chances are reset
function RollPseudoRandom(base_chance, entity)
  local chances_table = {
              {5, 0.38},
              {9, 1.20},
              {10, 1.48},
              {12, 2.10},
              {15, 3.22},
              {16, 3.65},
              {17, 4.09},
              {19, 5.06},
              {20, 5.57},
              {21, 6.11},
              {22, 6.67},
              {24, 7.85},
              {25, 8.48},
              {27, 9.78},
              {30, 11.9},
              {35, 15.8},
              {40, 20.20},
              {50, 30.20},
              {60, 42.30},
              {70, 57.10},
              {100, 100}
              }

  entity.pseudoRandomModifier = entity.pseudoRandomModifier or 0
  local prngBase
  for i = 1, #chances_table do
    if base_chance == chances_table[i][1] then      
      prngBase = chances_table[i][2]
    end  
  end

  if not prngBase then
    print("The chance was not found! Make sure to add it to the table or change the value.")
    return false
  end
  
  if RollPercentage( prngBase + entity.pseudoRandomModifier ) then
    entity.pseudoRandomModifier = 0
    return true
  else
    entity.pseudoRandomModifier = entity.pseudoRandomModifier + prngBase    
    return false
  end
end

--[[ Pseudo-random factors
0.01    0.000156    1.002238
0.02    0.000620    2.002579
0.03    0.001386    3.001511
0.04    0.002449    4.002288
0.05    0.003802    4.994758
0.06    0.005440    6.005638
0.07    0.007359    7.003934
0.08    0.009552    8.010426
0.09    0.012016    8.987512
0.10    0.014746    10.014611
0.11    0.017736    11.004199
0.12    0.020983    12.005177
0.13    0.024482    13.024971
0.14    0.028230    13.975791
0.15    0.032221    14.959288
0.16    0.036452    15.999053
0.17    0.040920    17.009059
0.18    0.045620    17.972132
0.19    0.050549    18.976664
0.20    0.055704    19.954822
0.21    0.061081    20.943636
0.22    0.066676    22.012710
0.23    0.072488    22.979420
0.24    0.078511    24.014735
0.25    0.084744    25.031101
0.26    0.091183    25.959664
0.27    0.097826    27.102915
0.28    0.104670    28.023057
0.29    0.111712    29.000554
0.30    0.118949    29.959944
0.31    0.126379    31.002753
0.32    0.134001    31.939392
0.33    0.141805    32.999597
0.34    0.149810    34.025757
0.35    0.157983    34.908278
0.36    0.166329    35.980153
0.37    0.174909    37.053368
0.38    0.183625    38.058557
0.39    0.192486    38.999431
0.40    0.201547    40.008482
0.41    0.210920    41.034227
0.42    0.220365    42.099236
0.43    0.229899    42.969354
0.44    0.239540    44.056551
0.45    0.249307    45.176913
0.46    0.259872    45.906516
0.47    0.270453    46.863211
0.48    0.281008    48.012061
0.49    0.291552    48.983830
0.50    0.302103    49.938326
0.51    0.312677    51.091310
0.52    0.323291    51.903294
0.53    0.334120    53.118028
0.54    0.347370    54.012304
0.55    0.360398    54.951094
0.56    0.373217    56.077072
0.57    0.385840    56.917788
0.58    0.398278    57.943470
0.59    0.410545    58.905304
0.60    0.422650    59.988002
0.61    0.434604    61.122079
0.62    0.446419    62.023197
0.63    0.458104    63.044547
0.64    0.469670    63.999181
0.65    0.481125    65.143609
0.66    0.492481    66.020110
0.67    0.507463    66.997186
0.68    0.529412    68.085570
0.69    0.550725    68.980741
0.70    0.571429    70.037330
0.71    0.591549    71.011632
0.72    0.611111    72.145387
0.73    0.630137    73.091401
0.74    0.648649    73.969421
0.75    0.666667    74.791519
0.76    0.684211    75.818460
0.77    0.701299    77.138471
0.78    0.717949    77.965415
0.79    0.734177    79.041386
0.80    0.750000    80.042903
0.81    0.765432    80.993302
0.82    0.780488    81.967885
0.83    0.795181    82.964831
0.84    0.809524    84.091559
0.85    0.823529    85.107832
0.86    0.837209    86.080003
0.87    0.850575    87.164960
0.88    0.863636    88.069258
0.89    0.876404    88.907065
0.90    0.888889    90.034934
0.91    0.901099    91.098742
0.92    0.913043    91.925283
0.93    0.924731    93.009413
0.94    0.936170    94.065413
0.95    0.947368    95.073302
0.96    0.958333    95.967448
0.97    0.969072    96.931159
0.98    0.979592    97.973900
0.99    0.989899    98.999119
--]]