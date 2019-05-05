local _M = require('apicast.policy').new('Nginx Example', '1.0.0')

local new = _M.new

function _M.new(configuration)
  local self = new(configuration)

  ngx.req.read_body()
  local args, err = ngx.req.get_post_args()
  for key, val in pairs(args) do
  	if key == "password" then
  		local ret = ngx.re.match(val, '.*%-%-.*')
  		if ret then
      			ngx.say("invalid username or password")
                end
  	elseif key == "password" then
      		local ret2 = ngx.re.match(val, ".*%-%-.*")
      		if ret2 then
          		ngx.say("invalid username or password")
      		end
  	end
  end

  return self
end

return _M
