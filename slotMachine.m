function [] = slotMachine()

global slot;
  slot.money = 0.00;
  slot.fig = figure('numbertitle', 'off', 'name', 'Casino Slot Machine');
     slot.moneyAvailableTitle = uicontrol('style', 'text', 'units', 'normalized', 'position', [.8 .78 .11 .095], 'string', 'Gambling Money:', 'horizontalalignment', 'right');
     slot.moneyAvailable = uicontrol('style', 'text', 'units', 'normalized', 'position',[.8 .71 .09 .05],'string', num2str(slot.money), 'horizontalalignment', 'right');
     slot.moneySlotTitle = uicontrol('style', 'text', 'units', 'normalized', 'position', [.8 .59 .11 .095], 'string', 'Add Gambling Money:', 'horizontalalignment', 'right');
     slot.moneySlot = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.8 .53 .14 .05], 'string', 'add 75', 'callback', {@totalMoney,.75});
        slot.RandomNumTitle = uicontrol('style', 'text', 'units', 'normalized', 'position', [.5 .78 .11 .095], 'string', 'Randomly Selected Number:', 'horizontalalignment', 'right');
        slot.random = 0;
        slot.randomNumber = uicontrol('style', 'text', 'units', 'normalized', 'position',[.5 .71 .09 .05],'string', num2str(slot.random), 'horizontalalignment', 'right');
        slot.SelectRandNumber = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.5 .63 .14 .05], 'string', 'Pull Lever', 'callback', {@randomVal});
            slot.targetNumTitle = uicontrol('style', 'text', 'units', 'normalized', 'position', [.2 .78 .09 .095], 'string', 'Target Number:', 'horizontalalignment', 'right');
            slot.target = 1;
            slot.targetNumber = uicontrol('style', 'text', 'units', 'normalized', 'position',[.2 .71 .09 .05],'string', num2str(slot.target), 'horizontalalignment', 'right');
               slot.targetNumSelect = uicontrol('Style', 'slider', 'units', 'normalized', 'Position', [.2 .49 .09 .05], 'value', 1, 'min',1 , 'max', 10, 'SliderStep', [1/(10-1) 1/9], 'Callback', {@targetVAl});
               slot.targetSelectTitle = uicontrol('style', 'text', 'units', 'normalized', 'position', [.2 .55 .09 .13], 'string', 'Select Target Number:', 'horizontalalignment', 'right');
                  slot.leverPull = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.50 .55 .18 .05], 'string' ,  'Pay Machine' , 'callback', {@slotToll,1.5,1});
                  slot.pullPrice = uicontrol('style', 'text', 'units', 'normalized', 'position', [.5 .49 .07 .05], 'string', '$1.00' ,  'horizontalalignment' ,  'right' );


    function [] = totalMoney(source, event, cash)
    slot.money = slot.money + cash;
    slot.moneyAvailable.String = num2str(slot.money);
end
    function [] = targetVAl(source, event, targetNum);
        slot.target = slot.targetNumSelect.Value;
         slot.targetNumber.String = num2str(slot.target);   
        
end
    function [] = randomVal(source, event)
        slot.random = randi([1,10]);
        slot.randomNumber.String = num2str(slot.random);
        if slot.random == slot.target
            disp('Congratutlations!!!')
        else 
            disp('You Lose! Try Again :)')
        end
    
    end
    function [] = slotToll(source, event, price, index)
        if slot.money >= price
            slot.money = slot.money - price
            slot.moneyAvailable.String = num2str(slot.money);
             product = ['You May Pull Lever'];
             msgbox(product, 'Slot Machine', 'modal');
        end
        
    end
end