class AddIndexToDerived < ActiveRecord::Migration
  def change
    add_index 'daily_airtempdatavalues', 'siteid'
    add_index 'daily_dischargedatavalues', 'siteid'
    add_index 'daily_rhdatavalues', 'siteid'
    add_index 'daily_precipdatavalues', 'siteid'
    add_index 'daily_snowdepthdatavalues', 'siteid'
    add_index 'daily_swedatavalues', 'siteid'
    add_index 'daily_winddirectiondatavalues', 'siteid'
    add_index 'daily_windspeeddatavalues', 'siteid'
  end
end
