$ ->
  # Format anything with the class format-date-time with moment.js
  # to local time; use this instead of $.each for performance reasons
  # textContent = ie9+, w3c compliant
  # innerText = ie8-
  # for element, index in $('.format-date-time')
  #   timestampUTC = element.textContent || element.innerText
  #   timestampLocal = moment(timestampUTC, 'YYYY-MM-DD HH:mm:ss Z').format('llll')

  #   if element.textContent
  #     element.textContent = timestampLocal
  #   else if element.innerText
  #     element.innerText = timestampLocal

  # jQuery Mask Inputs
  # $('.phone-us').mask('(000) 000-0000')
  # $('.zipcode-us').mask('00000')

  # Set bootstrap active nav bar
  $('a[href="' + this.location.pathname + '"]')
    .parent()
    .addClass('active')

  # Set back button
  $('a[data-action="back"]').on 'click', (e) ->
    e.preventDefault()
    history.back()

  # Autofocus input field in modals
  $('.modal').on 'shown.bs.modal', (e) ->
    $(this).find('input:text:visible:first').focus();

  # Render default table
  $('.table-default').DataTable
    pageLength: 25