const Scheme = require('./scheme-model');
/*
  Eğer `scheme_id` veritabanında yoksa:

  durum 404
  {
    "message": "scheme_id <gerçek id> id li şema bulunamadı"
  }
*/
const checkSchemeId = async (req, res, next) => {
  const { scheme_id } = req.params;

  const scheme = await Scheme.findById(scheme_id);

  if (!scheme) {
    return res.status(404).json({
      message: `scheme_id ${scheme_id} id li şema bulunamadı`,
    });
  }
  next();
};

/*
  Eğer `scheme_name` yoksa, boş string ya da string değil:

  durum 400
  {
    "message": "Geçersiz scheme_name"
  }
*/
const validateScheme = (req, res, next) => {
  const { scheme_name } = req.body;

  if (
    !scheme_name ||
    typeof scheme_name !== 'string' ||
    scheme_name.trim() === ''
  ) {
    return res.status(400).json({
      message: 'Geçersiz scheme_name',
    });
  }

  next();
}

/*
  Eğer `instructions` yoksa, boş string yada string değilse, ya da
  eğer `step_number` sayı değilse ya da birden küçükse:

  durum 400
  {
    "message": "Hatalı step"
  }
*/
const validateStep = (req, res, next) => {
  const { instructions, step_number } = req.body;

  if (
    !instructions ||
    typeof instructions !== 'string' ||
    instructions.trim() === '' ||
    typeof step_number !== 'number' ||
    step_number < 1
  ) {
    return res.status(400).json({
      message: 'Hatalı step',
    });
  }

  next();
}

module.exports = {
  checkSchemeId,
  validateScheme,
  validateStep,
}
