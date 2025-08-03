# frozen_string_literal: true
require 'ffcrm_endpoint'

class FfcrmWebookhookReadAi::MeetingEndpoint < FfcrmEndpoint::Endpoint

  #
  # https://support.read.ai/hc/en-us/articles/16352415827219-Getting-Started-with-Webhooks
  #
  def process
    payload = JSON.parse(request.body.read)
    owner_email = payload.dig("owner", "email")
    user = User.find_by(email: owner_email)

    return if user.nil?

    ActiveRecord::Base.transaction do
      payload["participants"].each do |participant|
        participant["email"]
        lead_or_contact = find_or_create_lead_or_contact(participant, user)

        next unless lead_or_contact

        # Create a Note
        lead_or_contact.notes.create(
          user: user,
          note: "Meeting Summary: #{payload['summary']}\n\nReport URL: #{payload['report_url']}"
        )
      end

      payload["action_items"].each do |action_item|
        Task.create(
          user: user,
          name: action_item["text"],
          assigned_to: user.id
        )
      end
    end
  end

  #
  # return true only if allowed to proceed.
  def authenticate
    # TODO: Refactor to a better approach or whitelist.
    # params[:token].present? && params[:token] == Setting.my_custom_endpoint[:token]
    request.remote_ip == '127.0.0.1'
  end

  def find_or_create_lead_or_contact(participant, user)
    contact = Contact.find_by(email: participant["email"])
    return contact if contact

    lead = Lead.find_by(email: participant["email"])
    return lead if lead

    Lead.create(
      first_name: participant["name"].split.first,
      last_name: participant["name"].split.last,
      email: participant["email"],
      user: user
    )
  end
end




  def verify_ip
    

    head :unauthorized
  end
end