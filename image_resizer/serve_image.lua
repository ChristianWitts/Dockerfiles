local image_type, id, base, sizename, ext =
    ngx.var.image_type, ngx.var.id, ngx.var.base, ngx.var.sizename, ngx.var.ext

s3 = require 's3'

local bucket = s3:connect{
    awsRole="IAM Role",
    bucket="S3 bucket name",
}

local remote_src = "http://example.s3.amazonaws.com/"

local function return_not_found(msg)
    ngx.status = ngx.HTTP_NOT_FOUND
    ngx.header["Content-type"] = "text/html"
    ngx.say(msg or "not found")
    ngx.exit(0)
end

local file = bucket:get(remote_src .. image_type .. "/" .. id .. "/" .. base .. "." .. ext)

if not file then
    return_not_found()
end

local dest_fname = cache_dir .. ngx.md5(size .. "/" .. path) .. "." .. ext

local magick = require("magick")
magick.thumb(source_fname, size, dest_fname)

ngx.exec(ngx.var.request_uri)
