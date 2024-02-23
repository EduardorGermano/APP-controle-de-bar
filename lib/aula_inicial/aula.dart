void main() {
  String disciplina = 'Desenvolvimento para Dispositivos Móveis (DDM)';
  double cargaHoraria = 90.50;
  String nomeProfessor = 'Helio';
  String sobrenomeProfesor = 'Kamakau';
  bool eAtiva = true;
  int quantidadeAlunos = 26;

  print('Aula de ' + disciplina);
  print('Professor: ' + nomeProfessor + ' ' + sobrenomeProfesor);
  print('Quantidade de Alunos: ' + '${quantidadeAlunos}');

  var nomeAluno = 'Eduardo';
  var registroAcademico = 20240001022;
  var altura = 1.65;
  var alunoAtivo = true;

  print('Nome do Aluno ' + nomeAluno);
  print('${registroAcademico}' +
      ' do aluno ' +
      '${nomeAluno}' +
      ' esta ativo ' +
      '${alunoAtivo}');

      
}
