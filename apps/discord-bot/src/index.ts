import { Client, Events } from "discord.js";
import { utility } from "./utility.js";
import { LogLevel } from "./enums.js";
import processENV from "dotenv";
processENV.config();

const bot = new Client({ intents: ["DirectMessages"] });

bot.on(Events.ClientReady, (e) => {
	utility.serverLog(LogLevel.NONE, "Discord Bot Ready!");
});

async function execute() {
	await bot.login(process.env.DISCORD_TOKEN);
}

execute();
