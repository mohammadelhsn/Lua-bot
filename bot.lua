local Discordia = require("Discordia")
--- @type Discordia.Client
local client = Discordia.Client();

Discordia.extensions();

client:on("ready", function()
    print("Logged in as " .. client.user.username .. "!");
    print(client.user);
    print(client.user:getAvatarURL())
end)

client:on("messageCreate", function(message)
    local content = message.content;
    local args = content:split(" ");
    if (args[1]== "!hello") then
        message.channel:send("Hello, " .. message.author.username .. "!");
    end
end)

local TokenFile = io.open("token.txt", "r");
local Token = TokenFile:read("*a");
TokenFile:close();
client:run('Bot '..Token)