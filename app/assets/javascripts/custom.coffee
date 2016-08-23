$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  $.rails.showConfirmDialog(link) # look bellow for implementations
  false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click.rails')

 $.rails.showConfirmDialog = (link) ->
  message = link.attr 'data-confirm'
  html = """
	         <div class="modal" id="confirmationDialog"  tabindex="-1" role="dialog" aria-hidden="true">
	         	<div class="modal-dialog">
			    	<div class="modal-content">
	           			<div class="modal-header">
	             			<a class="close" data-dismiss="modal">×</a>
	             			<h4 class="modal-title">Delete User</h4>
			        		<hr>
	           			</div>
			           <div class="modal-body">
			             #{message}
			           </div>
			           <div class="modal-footer">
			             <a data-dismiss="modal" class="btn">Cancel</a>
			             <a data-dismiss="modal" class="btn btn-primary confirm">OK</a>
			           </div>
	           		</div>
	           	</div>
	         </div>
         """
  $(html).modal()
  $('#confirmationDialog a.confirm').on 'click', -> $.rails.confirmed(link)