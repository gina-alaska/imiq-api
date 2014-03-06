class AddIndexToHourlyDerived < ActiveRecord::Migration
  def up
    apply_index 'hourly_airtempdatavalues', 'siteid'
    apply_index 'hourly_rhdatavalues', 'siteid'
    apply_index 'hourly_precipdatavalues', 'siteid'
    apply_index 'hourly_snowdepthdatavalues', 'siteid'
    apply_index 'hourly_swedatavalues', 'siteid'
    apply_index 'hourly_winddirectiondatavalues', 'siteid'
    apply_index 'hourly_windspeeddatavalues', 'siteid'
  end

  def apply_index(table, field)
    add_index(table, field) unless index_exists?(table, field)
  end
end
