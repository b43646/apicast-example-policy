local _M = require('apicast.policy').new('Nginx Example', '1.0.0')

local new = _M.new

content=''

function _M.new(configuration)
  local self = new(configuration)

  return self
end

local function deny_request(error_msg)
  ngx.status = ngx.HTTP_FORBIDDEN
  ngx.say(error_msg)
  ngx.exit(ngx.status)
end

function _M:access()

--  if ngx.req.get_method() ==  ngx.HTTP_POST then
  	ngx.req.read_body()
	local args, err = ngx.req.get_post_args()
  	for key, val in pairs(args) do
  		local ret = string.match(val, ".*%-%-.*")
                -- ngx.say(key,":",val," ",ret)
                -- ngx.exit(200)
  		if ret ~= nil then
            		content="invalid username or password"
        	end
  	end
--  end

  if content ~= '' then
    deny_request(content)
  end
end


return _M
