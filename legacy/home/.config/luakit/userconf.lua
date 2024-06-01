local webview = require('webview')
webview.hardware_acceleration_policy = 'never'

require('follow').pattern_maker = require('follow').pattern_styles.match_label

local select = require('select')

select.label_maker = function(s)
	return s.trim(s.sort(s.reverse(s.charset('arst'))))
end

require('vertical_tabs')
