/// @description move view
// You can write your code in this editor

#region Move the view

halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
halfViewHeight = camera_get_view_height(view_camera[0]) / 1.5;

camera_set_view_pos(view_camera[0], x - halfViewWidth, y -halfViewHeight);
#endregion