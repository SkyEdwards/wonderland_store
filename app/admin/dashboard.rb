ActiveAdmin.register_page "Dashboard" do
  
  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }
 

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        #span I18n.t("active_admin.dashboard_welcome.welcome")
        #small I18n.t("active_admin.dashboard_welcome.call_to_action")
        h1 "Welcome to the Admin Dashboard"
        small "From here you will be able to manage information regarding the customers, products, orders, and categories of Wonderland.com.
            This dashboard"
        small "you will also have the ability to change the content displayed on the contact and about pages."
      end
    end


    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
