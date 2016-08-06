require 'spec_helper'

describe 'invitations' do
  let!(:account) { create(:account_with_schema) }
  let(:user) { account.owner }

  before do
    set_subdomain(account.subdomain)
    sign_user_in(user)
    visit users_path
  end

  it 'allows projects to be created' do
    visit projects_path
    click_button 'New Project'

    fill_in 'Name', with: 'A new project'
    fill_in 'Client', with: 'POTY'

    expect(page).to_not have_text 'Archived'
    click_button 'Create Project'

    expect(page).to have_text 'Project created!'
    expect(page).to have_text 'A new project'
  end

  it 'displays projects validations' do
    visit projects_path
    click_button 'New Project'

    click_button 'Create Project'
    expect(page).to have_text "can't be blank"
  end

  it 'allows projects to be edited' do
    project = create(:project)

    visit projects_path
    click_edit_project_button project.name

    fill_in 'Name', with: 'An edited project'
    check "Archived"
    click_button 'Update Project'

    expect(page).to have_text 'Project updated!'
    expect(page).to have_text 'An edited project'
  end

  def click_edit_project_button(project_name)
    within find("h3", text: project_name) do
      page.first("a").click
    end
  end
end