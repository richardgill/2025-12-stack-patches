import baseConfig from "@2025-12-stack/config/vitest";
import { defineConfig, mergeConfig } from "vitest/config";

export default mergeConfig(
	baseConfig,
	defineConfig({
		test: {
			environment: "jsdom",
		},
	}),
);
