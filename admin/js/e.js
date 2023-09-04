KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="body"]', {
				cssPath : '../edit/plugins/code/prettify.css',
				uploadJson : '../edit/asp/upload_json.asp',
				fileManagerJson : '../edit/asp/file_manager_json.asp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=addform]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=addform]')[0].submit();
					});
				}
			});
			prettyPrint();
		});