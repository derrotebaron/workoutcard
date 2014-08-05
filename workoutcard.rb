#!/bin/env ruby
def cardify(title, year, exercise_groups)
    pre = <<HERE % [title]
\\vspace*{.2cm}
\\framebox{
\\begin{minipage}[t][.4\\paperheight][t]{.45\\paperwidth}
\\centering
\\vspace*{.4cm}
\\large\\textsc{%s}
\\footnotesize\\\\[.4cm]
\\begin{tabular}[h]{p{1ex}p{2.7cm}|clcl|c}
  &\\multicolumn{0}{c|}{\\textsc{Exercise}}&\\multicolumn{4}{c|}{\\textsc{Weight}}&\\textsc{Difficulty}\\\\
  &&\\multicolumn{2}{c}{\\textit{intended}}&\\multicolumn{2}{c|}{\\textit{actual}}&\\\\
  \\hline
HERE
    middle = (exercise_groups.map { |group| (group.map { |ex|
      exercise(ex[:name], ex[:variant], ex[:sets], ex[:reps]) }).join (next_line) }).join next_line(true)
    post = <<HERE % [year]
\\end{tabular}
\\vfill
\\normalsize
\\textnumero $\\,\\dots$\\qquad Date: $%s/\\dots/\\dots$
\\vspace*{.5cm}
\\end{minipage}}
HERE
    pre + middle + post
end

def exercise(name, variant, sets, reps)
  '$\sfrac{%s}{%s}$&{\textbf{%s}\par\hspace*{7pt}\textit{%s}}&\fillindots&\kg&\fillindots&\kg&\fillindots' % [sets, reps, name, variant]
end

def next_line(hline = false)
  '\\\\' + (hline ? '\hline' : '') + ?\n
end

def generate_doc(title, year, exercise_groups)
  preamble = <<HERE
\\documentclass[a4paper]{article}
\\usepackage{textcomp}
\\usepackage[margin=.3cm]{geometry}
\\usepackage{array}
\\usepackage{realboxes}
\\usepackage{xfrac}

\\begin{document}

\\setlength\\extrarowheight{3pt}
\\setlength{\\parindent}{0cm} 


\\newcommand{\\fillindots}{\\raisebox{-.3cm}{$\\dots\\dots$}}
\\newcommand{\\kg}{\\raisebox{-.2cm}{kg}}
HERE

  middle = cardify(title, year, exercise_groups)
  postamble = '\end{document}'
  preamble + middle * 2 + '\\\\\vspace*{1cm}' + middle * 2 + postamble
end

workout = eval File.open(ARGV[0]).read
puts (generate_doc workout[:title], workout[:year], workout[:exercises])
