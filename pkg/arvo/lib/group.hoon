/-  *group
/+  store=group-store, resource
::
|_  =bowl:gall
+$  card  card:agent:gall
++  scry-for
  |*  [=mold =path]
  =.  path
    (snoc path %noun)
  .^  mold
    %gx
    (scot %p our.bowl)
    %group-store
    (scot %da now.bowl)
    path
  ==
++  scry-tag
  |=  [rid=resource =tag]
  ^-  (unit (set ship))
  =/  group
    (scry-group rid)
  ?~  group
    ~
  `(~(gut by tags.u.group) tag ~)
::
++  scry-group
  |=  rid=resource
  %+  scry-for  ,(unit group)
  `path`groups+(en-path:resource rid)
::
++  scry-groups
  .^  ,(set resource)
    %gy
    (scot %p our.bowl)
    %group-store
    (scot %da now.bowl)
    /groups/noun
  ==
::
++  members
  |=  rid=resource
  =;  =group
    members.group
  (fall (scry-group rid) *group)
::
++  is-member
  |=  [=ship group=resource]
  ^-  ?
  =-  (~(has in -) ship)
  (members group)
::
++  is-admin
  |=  [=ship group=resource]
  ^-  ?
  =/  tags  tags:(fall (scry-group group) *^group)
  =/  admins=(set ^ship)  (~(gut by tags) %admin ~)
  (~(has in admins) ship)
::  +role-for-ship: get role for user
::
::    Returns ~ if no such group exists or user is not
::    a member of the group. Returns [~ ~] if the user
::    is a member with no additional role.
++  role-for-ship
  |=  [rid=resource =ship]
  ^-  (unit (unit role-tag))
  =/  grp=(unit group)
    (scry-group rid)
  ?~  grp  ~
  =*  group   u.grp
  =*  policy  policy.group
  =*  tags    tags.group
  =/  admins=(set ^ship)
    (~(gut by tags) %admin ~)
  ?:  (~(has in admins) ship)
    ``%admin
  =/  mods
    (~(gut by tags) %moderator ~)
  ?:  (~(has in mods) ship)
    ``%moderator
  =/  janitors
    (~(gut by tags) %janitor ~)
  ?:  (~(has in janitors) ship)
    ``%janitor
  ?:  (~(has in members.group) ship)
    [~ ~]
  ~
::
++  can-join
  |=  [rid=resource =ship]
  %+  scry-for  ,?
  ^-  path
  :-  %groups
  (weld (en-path:resource rid) /join/(scot %p ship))
::
++  is-managed
  |=  rid=resource
  =/  group=(unit group)
    (scry-group rid)
  ?~  group  %.n
  !hidden.u.group
::
--
