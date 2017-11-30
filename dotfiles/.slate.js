var fullScreen = slate.operation('move', {
  'height': 'screenSizeY',
  'width': 'screenSizeX',
  'x': 'screenOriginX',
  'y': 'screenOriginY'
});

var pushLeft = slate.operation('push', {
  'direction': 'left',
  'style': 'bar-resize:screenSizeX/2'
});

var pushRight = slate.operation('push', {
  'direction': 'right',
  'style': 'bar-resize:screenSizeX/2'
});

slate.bind('up:ctrl,cmd,alt', fullScreen);
slate.bind('left:ctrl,cmd,alt', pushLeft);
slate.bind('right:ctrl,cmd,alt', pushRight);
