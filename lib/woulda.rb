require 'woulda/acts_as_ferret' if defined? ActsAsFerret
require 'woulda/acts_as_list' if defined? ActiveRecord::Acts::List
require 'woulda/acts_as_paranoid' if defined? Caboose::Acts::Paranoid
require 'woulda/acts_as_taggable_on_steroids' if defined? ActiveRecord::Acts::Taggable
require 'woulda/attachment_fu' if defined? Technoweenie::AttachmentFu
require 'woulda/enumerations_mixin' if defined? ActiveRecord::Acts::Enumerated
require 'woulda/paperclip' if defined? Paperclip
require 'woulda/will_paginate' if defined? WillPaginate