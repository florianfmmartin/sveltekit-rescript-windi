import preprocess from 'svelte-preprocess';
import WindiCSS from 'vite-plugin-windicss';
import createReScriptPlugin from '@jihchi/vite-plugin-rescript';

const config = {
	preprocess: preprocess(),
	kit: {
		target: '#svelte',
		vite: () => ({
			plugins: [
				WindiCSS.default(),
				createReScriptPlugin.default(),
			]
		})
	}
};

export default config;
