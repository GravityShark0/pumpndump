local webview = require('webview')
webview.hardware_acceleration_policy = 'never'

local select = require('select')

select.label_maker = function(s)
	local chars = s.charset('arstneio')
	return s.trim(s.sort(s.reverse(chars)))
end

require('vertical_tabs')
