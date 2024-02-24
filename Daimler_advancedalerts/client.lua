local firstSpawn = true

-- Discord Invite Alert Script
function ShowDiscordInviteAlert()
    local alert = lib.alertDialog({
        header = 'Join our Discord',
        content = 'Don\'t forget to join our Discord server! discord.gg/circuitrp',
        centered = true,
        cancel = true,
        size = 'md',
        labels = {
            cancel = 'Close',
            confirm = 'Confirm'
        }
    })

    if alert == 'confirm' then
        lib.notify({
            title = 'Enjoy your stay on the server!',
            description = 'If you need assistance, use /report',
            type = 'inform'
        })
        -- Add actions to be taken when the "Confirm" button is pressed
        -- For example, opening an external link to the Discord invite
        print('Player has decided to join the Discord!')
    else
        lib.notify({
            title = 'Recommendation',
            description = 'We recommend joining our Discord server to stay updated on all the news.',
            type = 'inform'
        })
        -- Add actions to be taken when the "Close" button or ESC key is pressed
        print('Player has decided to close the alert.')
    end
end

-- Function to trigger the alert on player spawn
AddEventHandler('esx:onPlayerSpawn', function()
    local playerId = source

    if firstSpawn then
        ShowDiscordInviteAlert()
        firstSpawn = false
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000) -- Checks every minute

        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            if status.val < 50000 then
                local message
                local isHunger = true -- Set to false if checking for thirst

                if isHunger then
                    message = 'You are hungry, please eat something.'
                else
                    message = 'You are thirsty, please drink something.'
                end

                local alert = lib.alertDialog({
                    header = 'Alert',
                    content = message,
                    centered = true,
                    cancel = true,
                    size = 'md',
                    labels = {
                        cancel = 'Close',
                        confirm = 'Confirm'
                    }
                })

                if alert == 'confirm' then
                    -- Add actions to be taken when the "Confirm" button is pressed
                    print('Player confirmed the alert.')
                else
                    -- Add actions to be taken when the "Close" button or ESC key is pressed
                    print('Player decided to close the alert.')
                end
            end
        end)
    end
end)
