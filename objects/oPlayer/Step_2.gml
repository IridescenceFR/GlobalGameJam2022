/// @description Move the view

#region

halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
thirdViewHeight = camera_get_view_height(view_camera[0]) / 1.5;


camera_set_view_pos(view_camera[0], x - halfViewWidth, y - thirdViewHeight);

#endregion