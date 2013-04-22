jQuery ->
  new AvatarCropper()

class AvatarCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update
  model = $('.model').attr('id')
  update: (coords) =>
    $('#post_crop_x').val(coords.x)
    $('#post_crop_y').val(coords.y)
    $('#post_crop_w').val(coords.w)
    $('#post_crop_h').val(coords.h)