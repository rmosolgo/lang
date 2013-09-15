
PULMONIC_CONSONANTS = [
  { letter: "m̥", features: %w{voiceless bilabial nasal} },
  { letter: "m", features: %w{voiced bilabial nasal} },
  { letter: "ɱ", features: %w{voiced labiodental nasal} },
  { letter: "n̪", features: %w{voiced dental nasal} },
  { letter: "n̥", features: %w{voiceless alveolar nasal} },
  { letter: "n", features: %w{voiced alveolar nasal} },
  { letter: "n̠", features: %w{voiced postalveolar nasal} },
  { letter: "ɳ̊", features: %w{voiceless retroflex nasal} },
  { letter: "ɳ", features: %w{voiced retroflex nasal} },
  { letter: "ɲ̟", features: %w{voiced alveolopalatal nasal} },
  { letter: "ɲ̊", features: %w{voiceless palatal nasal} },
  { letter: "ɲ", features: %w{voiced palatal nasal} },
  { letter: "ŋ̊", features: %w{voiceless velar nasal} },
  { letter: "ŋ", features: %w{voiced velar nasal} },
  { letter: "ɴ", features: %w{voiced uvular nasal} },
  { letter: "p", features: %w{voiceless bilabial stop} },
  { letter: "b", features: %w{voiced bilabial stop} },
  { letter: "p̪", features: %w{voiceless labiodental stop} },
  { letter: "b̪", features: %w{voiced labiodental stop} },
  { letter: "t̪", features: %w{voiceless dental stop} },
  { letter: "d̪", features: %w{voiced dental stop} },
  { letter: "t", features: %w{voiceless alveolar stop} },
  { letter: "d", features: %w{voiced alveolar stop} },
  { letter: "ʈ", features: %w{voiceless retroflex stop} },
  { letter: "ɖ", features: %w{voiced retroflex stop} },
  { letter: "c", features: %w{voiceless palatal stop} },
  { letter: "ɟ", features: %w{voiced palatal stop} },
  { letter: "k", features: %w{voiceless velar stop} },
  { letter: "ɡ", features: %w{voiced velar stop} },
  { letter: "q", features: %w{voiceless uvular stop} },
  { letter: "ɢ", features: %w{voiced uvular stop} },
  { letter: "ʡ", features: %w{epiglottal stop} },
  { letter: "ʔ", features: %w{voiceless glottal stop} },
  { letter: "s̪", features: %w{voiceless dental sibilant fricative} },
  { letter: "z̪", features: %w{voiced dental sibilant fricative} },
  { letter: "s", features: %w{voiceless alveolar sibilant fricative} },
  { letter: "z", features: %w{voiced alveolar sibilant fricative} },
  { letter: "ʃ", features: %w{voiceless postalveolar sibilant fricative} },
  { letter: "ʒ", features: %w{voiced postalveolar sibilant fricative} },
  { letter: "ʂ", features: %w{voiceless retroflex sibilant fricative} },
  { letter: "ʐ", features: %w{voiced retroflex sibilant fricative} },
  { letter: "ɕ", features: %w{voiceless alveolopalatal sibilant fricative} },
  { letter: "ʑ", features: %w{voiced alveolopalatal sibilant fricative} },
  { letter: "ɸ", features: %w{voiceless bilabial fricative} },
  { letter: "β", features: %w{voiced bilabial fricative} },
  { letter: "f", features: %w{voiceless labiodental fricative} },
  { letter: "v", features: %w{voiced labiodental fricative} },
  { letter: "θ", features: %w{voiceless dental fricative} },
  { letter: "ð", features: %w{voiced dental fricative} },
  { letter: "θ̱", features: %w{voiceless alveolar fricative} },
  { letter: "ð̠", features: %w{voiced alveolar fricative} },
  { letter: "ç", features: %w{voiceless palatal fricative} },
  { letter: "ʝ", features: %w{voiced palatal fricative} },
  { letter: "x", features: %w{voiceless velar fricative} },
  { letter: "ɣ", features: %w{voiced velar fricative} },
  { letter: "χ", features: %w{voiceless uvular fricative} },
  { letter: "ʁ", features: %w{voiced uvular fricative} },
  { letter: "ħ", features: %w{voiceless pharyngeal fricative} },
  { letter: "ʕ", features: %w{voiced pharyngeal fricative} },
  { letter: "ʜ", features: %w{voiceless epiglottal fricative} },
  { letter: "ʢ", features: %w{voiced epiglottal fricative} },
  { letter: "h", features: %w{voiceless glottal fricative} },
  { letter: "ɦ", features: %w{voiced glottal fricative} },
  { letter: "ʋ", features: %w{voiced labiodental approximant} },
  { letter: "ɹ", features: %w{voiced alveolar approximant} },
  { letter: "ɻ", features: %w{voiced retroflex approximant} },
  { letter: "j̊", features: %w{voiceless palatal approximant} },
  { letter: "j", features: %w{voiced palatal approximant} },
  { letter: "ɰ", features: %w{voiced velar approximant} },
  { letter: "ⱱ̟", features: %w{voiced bilabial flap} },
  { letter: "ⱱ", features: %w{voiced labiodental flap} },
  { letter: "ɾ", features: %w{voiced alveolar flap} },
  { letter: "ɽ", features: %w{voiced retroflex flap} },
  { letter: "ɢ̆", features: %w{voiced uvular flap} },
  { letter: "ʡ̯", features: %w{voiced epiglottal flap} },
  { letter: "ʙ", features: %w{voiced bilabial trill} },
  { letter: "r̥", features: %w{voiceless alveolar trill} },
  { letter: "r", features: %w{voiced alveolar trill} },
  { letter: "ɽ͡r", features: %w{voiced retroflex trill} },
  { letter: "ʀ", features: %w{voiced uvular trill} },
  { letter: "ᴙ ", features: %w{voiced epiglottal trill} },
  { letter: "ɬ", features: %w{voiceless alveolar lateral fricative} },
  { letter: "ɮ", features: %w{voiced alveolar lateral fricative} },
  { letter: "ɬ̢", features: %w{voiceless postalveolar lateral fricative } },
  { letter: "ʎ̝̊", features: %w{voiceless palatal lateral fricative} },
  { letter: "ʟ̝̊", features: %w{voiceless velar lateral fricative} },
  { letter: "ʟ̝", features: %w{voiced velar lateral fricative} },
  { letter: "l̥", features: %w{voiceless alveolar lateral approximant} },
  { letter: "l", features: %w{voiced alveolar lateral approximant} },
  { letter: "ɭ", features: %w{voiced retroflex lateral approximant} },
  { letter: "ʎ̟", features: %w{voiced alveolopalatal lateral approximant} },
  { letter: "ʎ", features: %w{voiced palatal lateral approximant} },
  { letter: "ʟ", features: %w{voiced velar lateral approximant} },
  { letter: "ɺ", features: %w{voiced alveolar lateral flap} },
  { letter: "ɺ̢", features: %w{voiced retroflex lateral flap} },
  { letter: "ʎ̯", features: %w{voiced palatal lateral flap} },
  { letter: "ʟ̆", features: %w{voiced velar lateral flap} },
]

NON_PULMONIC_CONSONANTS= [
  { letter: "ʘ", features: %w{bilabial click} },
  { letter: "ǀ", features: %w{dental click} },
  { letter: "ǃ", features: %w{alveolar click} },
  { letter: "ǂ", features: %w{palatal click} },
  { letter: "ǁ", features: %w{lateral click} },
  { letter: "ʘ̃", features: %w{nasal click} },
  { letter: "ʘ̃ˀ", features: %w{glottal click} },
  { letter: "‼", features: %w{retroflex click} },
  { letter: "ɓ̥", features: %w{voiceless bilabial implosive} },
  { letter: "ɓ", features: %w{voiced bilabial implosive} },
  { letter: "ɗ̥", features: %w{voiceless alveolar implosive} },
  { letter: "ɗ", features: %w{voiced alveolar implosive} },
  { letter: "ᶑ", features: %w{voiced retroflex implosive} },
  { letter: "ʄ̊", features: %w{voiceless palatal implosive} },
  { letter: "ʄ", features: %w{voiced palatal implosive} },
  { letter: "ɠ", features: %w{voiced velar implosive} },
  { letter: "ʛ", features: %w{voiceless uvular implosive} },
]

EJECTIVES = [
  { letter: "pʼ", features: %w{} },
  { letter: "t̪ʼ", features: %w{} },
  { letter: "tʼ", features: %w{} },
  { letter: "ʈʼ", features: %w{} },
  { letter: "cʼ", features: %w{} },
  { letter: "kʼ", features: %w{} },
  { letter: "qʼ", features: %w{} },
  { letter: "fʼ", features: %w{} },
  { letter: "θʼ", features: %w{} },
  { letter: "sʼ", features: %w{} },
  { letter: "ɬʼ", features: %w{} },
  { letter: "ʃʼ", features: %w{} },
  { letter: "ʂʼ", features: %w{} },
  { letter: "ɕʼ", features: %w{} },
  { letter: "xʼ", features: %w{} },
  { letter: "χʼ", features: %w{} },
  { letter: "tsʼ", features: %w{} },
  { letter: "tɬʼ", features: %w{} },
  { letter: "cʎ̝̥ʼ", features: %w{} },
  { letter: "tʃʼ", features: %w{} },
  { letter: "ʈʂʼ", features: %w{} },
  { letter: "kxʼ", features: %w{} },
  { letter: "kʟ̝̊ʼ", features: %w{} },
  { letter: "qχʼ", features: %w{} },
]
AFFRICATES = [
  { letter: "p̪f", features: %w{voiceless labiodental affricate} },
  { letter: "b̪v", features: %w{voiced labiodental affricate} },
  { letter: "ts", features: %w{voiceless alveolar sibilant affricate} },
  { letter: "dz", features: %w{voiced alveolar sibilant affricate} },
  { letter: "t̪s̪", features: %w{voiceless dental sibilant affricate} },
  { letter: "d̪z̪", features: %w{voiced dental sibilant affricate} },
  { letter: "tθ", features: %w{voiceless dental affricate} },
  { letter: "dð", features: %w{voiced dental affricate} },
  { letter: "tʃ", features: %w{voiceless palatal alveolar affricate} },
  { letter: "dʒ", features: %w{voiced palatal alveolar affricate} },
  { letter: "tɕ", features: %w{voiceless alveolopalatal affricate} },
  { letter: "dʑ", features: %w{voiced alveolopalatal affricate} },
  { letter: "ʈʂ", features: %w{voiceless retroflex affricate} },
  { letter: "ɖʐ", features: %w{voiced retroflex affricate} },
  { letter: "tɬ", features: %w{voiceless alveolar lateral affricate} },
  { letter: "dɮ", features: %w{voiced alveolar lateral affricate} },
  { letter: "cç", features: %w{voiceless palatal affricate} },
  { letter: "ɟʝ", features: %w{voiced palatal affricate} },
  { letter: "cʎ̥˔", features: %w{voiceless palatal lateral affricate} },
  { letter: "kx", features: %w{voiceless velar affricate} },
  { letter: "ɡɣ", features: %w{voiced velar affricate} },
  { letter: "kʟ̝̊", features: %w{voiceless velar lateral affricate} },
  { letter: "ɡʟ̝", features: %w{voiced velar lateral affricate} },
  { letter: "qχ", features: %w{voiceless uvular affricate} },
  { letter: "ɢʁ", features: %w{voiceless uvular affricate} },
]

COARTICULATED_CONSONANTS=[
  { letter: "ʍ", features: %w{voiceless labial velar approximant} },
  { letter: "w", features: %w{voiced labial velar approximant} },
  { letter: "ɥ", features: %w{voiced labial palatal approximant} },
  { letter: "ɧ", features: %w{voiceless palatal alveolar fricative} },
  { letter: "k͡p", features: %w{voiceless labial velar stop} },
  { letter: "ɡ͡b", features: %w{voiced labial velar stop} },
  { letter: "ŋ͡m", features: %w{voiced labial velar nasal} },
]

CONSONANTS = (
  PULMONIC_CONSONANTS + 
  NON_PULMONIC_CONSONANTS + 
  # EJECTIVES +
  AFFRICATES + 
  COARTICULATED_CONSONANTS
)
