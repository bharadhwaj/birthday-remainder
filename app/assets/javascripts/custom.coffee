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
         <div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="modal-title" id="myModalLabel">Delete User</h4>
		        <hr>
		      </div>
		      <div class="modal-body">
		        Are you sure you want to remove user?
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
  $('#delModal .confirm').on 'click', -> $.rails.confirmed(link)