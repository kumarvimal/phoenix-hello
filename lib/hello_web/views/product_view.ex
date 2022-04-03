defmodule HelloWeb.ProductView do
  use HelloWeb, :view

  def category_select(f, changeset) do
    existing_ids = changeset |> Ecto.Changeset.get_change(:categories, []) |> Enum.map(& &1.data.id)

    category_opts =
      for cat <- Hello.Catalog.list_categories(),
        do: [key: cat.title, value: cat.id, selected: cat.id in existing_ids]

      multiple_select(f, :category_idds, category_opts)
  end
end
