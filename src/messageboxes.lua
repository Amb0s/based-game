messageboxes = {}

messageboxes.font = love.graphics.newFont("fonts/enter_command.ttf", 48)
messageboxes.talkSound = love.audio.newSource("sounds/message_end.ogg", "static")
messageboxes.textSpeed = "fast"
messageboxes.messageBackgroundColor = {0, 0, 0, 0.9}
messageboxes.messageBorderColor = {1, 1, 1, 0.9}
messageboxes.rounding = 8
messageboxes.thickness = 2
messageboxes.typedNotTalked = false

function createMessageBox(name, messages, portrait)
    talkies.say(name, messages, {
        thickness = messageboxes.thickness,
        rounding = messageboxes.rounding,
        messageBorderColor = messageboxes.messageBorderColor,
        messageBackgroundColor = messageboxes.messageBackgroundColor,
        image = portrait,
        textSpeed = messageboxes.textSpeed,
        font = messageboxes.font,
        typedNotTalked = messageboxes.typedNotTalked,
        talkSound = messageboxes.talkSound
    })
end

function messageboxes:update(dt)
    talkies.update(dt)
end

function messageboxes:draw()
    talkies.draw()
end
