class AddIndexToHourlyDerived < ActiveRecord::Migration
  def change
    add_index 'hourly_airtempdatavalues', 'siteid'
    add_index 'hourly_rhdatavalues', 'siteid'
    add_index 'hourly_precipdatavalues', 'siteid'
    add_index 'hourly_snowdepthdatavalues', 'siteid'
    add_index 'hourly_swedatavalues', 'siteid'
    add_index 'hourly_winddirectiondatavalues', 'siteid'
    add_index 'hourly_windspeeddatavalues', 'siteid'
  end
end
