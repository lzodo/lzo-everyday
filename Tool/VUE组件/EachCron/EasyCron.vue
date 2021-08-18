<template>
	<el-dialog
		title="设值cron规则"
		:visible.sync="showModal"
		width="68%"
		:before-close="handleCloseOld"
		append-to-body
	>
		<easy-cron
			class="cronman"
			v-model="cronValue2"
			:hideYear="true"
		></easy-cron>
	</el-dialog>
</template>

<script>
import EasyCron from "./easy-cron";
import CronValidator from "./easy-cron/validator";
//"cron-parser"
//"debounce"
//"iview" 使用easycron需安装 这三个依赖

export default {
	name: "cron",
	data() {
		return {
			cronValue2: "",
			formDataValidator: {
				cronValue2: [{ validator: CronValidator }],
			},
		};
	},
	props: {
		defaultval: {
			type: String,
			default: "",
		},
		showModal: {
			type: Boolean,
			default: false,
		},
	},
	watch: {
		cronValue2(newval, old) {
			this.$emit("changecron", newval);
		},
	},
	methods: {
		handleCloseOld() {
			this.$emit("close");
		},
	},
	components: {
		EasyCron,
	},
	created() {
		if (this.defaultval && this.defaultval.split(" ").length >= 5) {
			this.cronValue2 = this.defaultval;
		}else{
			this.$message.error({
				showClose: true,
				message: "cron规则无效 重置为 * * * * * ?",
				duration: 2500,
				customClass:'zZindex'
			});
		}
	},
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.cronman {
	width: 100%;
}
</style>
<style>
.zZindex{
	z-index: 3000000 !important ;
}
</style>>
