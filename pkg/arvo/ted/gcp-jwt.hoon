/-  spider, settings
/+  strandio
=,  strand=strand:spider
^-  thread:spider
|=  vase
=/  m  (strand ,vase)
^-  form:m
;<  =bowl:spider  bind:m  get-bowl:strandio
=/  =data:settings
  .^  data:settings
    %gx
    (scot %p our.bowl)
    %settings-store
    (scot %da now.bowl)
    %entry
    %gcp-store
    %service-account-json
    %settings-data
    ~
  ==
~&  data
(pure:m !>(~))
