#
# Copyright 2011, Peter Donald
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

use_inline_resources


action :add do
  port = new_resource.port
  port = port.to_s.prepend "!" if new_resource.port >= 512

  file "/etc/authbind/byport/#{port}" do
    owner new_resource.user
    group new_resource.group if new_resource.group
    mode "0550"
    action :create
  end
end

action :remove do
  port = new_resource.port
  port = port.to_s.prepend "!" if new_resource.port >= 512

  file "/etc/authbind/byport/#{port}" do
    action :delete
  end
end
