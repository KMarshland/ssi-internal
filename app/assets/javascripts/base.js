//set the csrf headers with ajax
// beforeSend: fixCSRF
function fixCSRF(xhr) {
    xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
}