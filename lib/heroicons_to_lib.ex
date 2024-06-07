defmodule HeroiconsToLib do
  @moduledoc """
  Documentation for `HeroiconsToLib`.
  """
  import XmlToMap

  def generate_library_file(input_path, output_path) do
    files = files_in_directory(input_path)
    contents = """
    <svg fill="none" xmlns="http://www.w3.org/2000/svg">
    """

    path_nodes = Enum.map(files, fn filename ->
      IO.puts(filename)
      paths = extract_paths_from_svg(input_path, filename)
      make_nodes_from_paths(filename, paths)
    end)

    contents = contents <> Enum.join(path_nodes, "\n") <> "\n</svg>"

    File.write!(output_path, contents)
  end

  def files_in_directory(dir) do
    File.ls!(dir)
  end

  def extract_paths_from_svg(input_path, svg_file) do
    xml = File.read!(Path.join(input_path, svg_file))
    %{"svg" => %{"#content" => %{"path" => paths}}} = naive_map(xml)
    List.wrap(paths)
  end

  def make_nodes_from_paths(filename, paths) do
    path_nodes = Enum.map(paths, fn path ->
      "<path d=\"#{path["-d"]}\" stroke=\"currentColor\" stroke-linecap=\"#{path["-stroke-linecap"]}\" stroke-linejoin=\"#{path["-stroke-linejoin"]}\" stroke-width=\"#{path["-stroke-width"]}\" />"
    end)
    "<g title=\"#{title_from_filename(filename)}\">" <> Enum.join(path_nodes, "") <> "</g>"
  end

  def name_from_filename(filename) do
    filename
    |> Path.split()
    |> List.last()
    |> Path.rootname()
    |> String.replace(~w[- _], " ")
  end

  def title_from_filename(filename) do
    filename
    |> Path.split()
    |> List.last()
    |> Path.rootname()
    |> String.replace(~w[_], "-")
  end
end
