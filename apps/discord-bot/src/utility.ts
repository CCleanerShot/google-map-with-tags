import { LogLevel } from "./enums.js";

export const utility = {
	serverLog: (logLevel: LogLevel, message: string) => {
		let prefix = "";
		switch (logLevel) {
			case LogLevel.NONE:
				prefix = ">";
				break;
			case LogLevel.WARN:
				prefix = "?";
				break;
			case LogLevel.ERROR:
				prefix = "!";
				break;
		}

		console.log(`${prefix}: ${message}`);
	},
};
