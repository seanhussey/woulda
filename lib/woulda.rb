woulda_dir = File.expand_path(File.dirname(__FILE__)) + '/woulda'
require "#{woulda_dir}/should_raise"
require "#{woulda_dir}/acts_as_ferret" if defined? ActsAsFerret
require "#{woulda_dir}/acts_as_list" if defined? ActiveRecord::Acts::List
require "#{woulda_dir}/acts_as_paranoid" if defined? Caboose::Acts::Paranoid
require "#{woulda_dir}/acts_as_taggable_on_steroids" if defined? ActiveRecord::Acts::Taggable
require "#{woulda_dir}/attachment_fu" if defined? Technoweenie::AttachmentFu
require "#{woulda_dir}/enumerations_mixin" if defined? ActiveRecord::Acts::Enumerated
require "#{woulda_dir}/paperclip" if defined? Paperclip
require "#{woulda_dir}/will_paginate" if defined? WillPaginate
require "#{woulda_dir}/acts_as_solr" if defined? ActsAsSolr
require "#{woulda_dir}/acts_as_state_machine" if defined? ScottBarron::Acts::StateMachine
