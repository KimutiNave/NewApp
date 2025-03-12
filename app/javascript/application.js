// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap

import "@hotwired/turbo-rails";
import "./controllers";
import "@fortawesome/fontawesome-free";
import { Application } from '@hotwired/stimulus';
import { Autocomplete } from 'stimulus-autocomplete';

const application = Application.start()
application.register('autocomplete', Autocomplete)

import 'custom/another_option';
import 'custom/other_option';
import 'original/other_option';
import 'original/navbar_custum';
import './users/toggle_password';
import 'custom/text_limit';
