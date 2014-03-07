class AddIndexToDerived < ActiveRecord::Migration
  def up
    apply_index 'daily_airtempdatavalues', 'siteid'
    apply_index 'daily_dischargedatavalues', 'siteid'
    apply_index 'daily_rhdatavalues', 'siteid'
    apply_index 'daily_precipdatavalues', 'siteid'
    apply_index 'daily_snowdepthdatavalues', 'siteid'
    apply_index 'daily_swedatavalues', 'siteid'
    apply_index 'daily_winddirectiondatavalues', 'siteid'
    apply_index 'daily_windspeeddatavalues', 'siteid'
  end
  
  def apply_index(table, field)
    add_index(table, field) unless index_exists?(table, field)
  end
end
