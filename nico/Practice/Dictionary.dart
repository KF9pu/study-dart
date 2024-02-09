enum DictionaryKey { term, definition }

typedef DictionaryInfo = Map<DictionaryKey, String>;

typedef CustomFunction = void Function();

void printWrapper(CustomFunction function, String taskName) {
  print("┌─ Start [${taskName}] !! ─┐");
  function();
  print("└─ End [${taskName}] !! ─┘");
  print("");
}

class Dictionary {
  List<DictionaryInfo> storage = [];

  DictionaryInfo add({
    required String term,
    required String definition,
  }) {
    storage.add({
      DictionaryKey.term: term,
      DictionaryKey.definition: definition,
    });
    return storage.last;
  }

  DictionaryInfo? get({required String term}) {
    var existingEntryIndex = exists(term: term);
    if (existingEntryIndex == -1) {
      print('│ 사전에 등록되지 않은 단어인 것 같아요. 😂');
      return null;
    }

    var dictionaryInfo = storage[existingEntryIndex];
    print('│ term: ${dictionaryInfo[DictionaryKey.term]}');
    print('│ Definition: ${dictionaryInfo[DictionaryKey.definition]}');
    return dictionaryInfo;
  }

  String delete({required String term}) {
    storage.removeWhere(
        (dictionaryInfo) => dictionaryInfo[DictionaryKey.term] == term);

    return term;
  }

  DictionaryInfo? update({
    required String term,
    required String definition,
  }) {
    var existingEntryIndex = exists(term: term);
    if (existingEntryIndex == -1) return null;

    storage[existingEntryIndex] = {
      DictionaryKey.term: term,
      DictionaryKey.definition: definition,
    };

    return storage[existingEntryIndex];
  }

  void showAll() {
    for (var dictionaryInfo in storage) {
      print('│ term: ${dictionaryInfo[DictionaryKey.term]}');
      print('│ Definition: ${dictionaryInfo[DictionaryKey.definition]}');
      if (dictionaryInfo != storage.last) print('├─────────');
    }
  }

  int count() => storage.length;

  DictionaryInfo? upsert({
    required String term,
    required String definition,
  }) {
    var existingEntryIndex = exists(term: term);

    if (existingEntryIndex != -1) {
      storage[existingEntryIndex] = {
        DictionaryKey.term: term,
        DictionaryKey.definition: definition,
      };
      return storage[existingEntryIndex];
    } else {
      storage.add({
        DictionaryKey.term: term,
        DictionaryKey.definition: definition,
      });
      return storage.last;
    }
  }

  int exists({required String term}) {
    var existingEntryIndex =
        storage.indexWhere((info) => info[DictionaryKey.term] == term);
    return existingEntryIndex;
  }

  List<DictionaryInfo>? bulkAdd(
      {required List<DictionaryInfo> dictionaryInfos}) {
    List<DictionaryInfo> resultDictionaryInfos = [];
    for (var dictionaryInfo in dictionaryInfos) {
      upsert(
        term: dictionaryInfo[DictionaryKey.term].toString(),
        definition: dictionaryInfo[DictionaryKey.definition].toString(),
      );
      resultDictionaryInfos.add(storage.last);
    }
    return resultDictionaryInfos;
  }

  List<String> bulkDelete({required Set<String> terms}) {
    List<String> resultTerms = [];
    for (var term in terms) {
      var existingEntryIndex = exists(term: term);
      if (existingEntryIndex != -1) {
        delete(term: term);
        resultTerms.add(term);
      }
    }
    return resultTerms;
  }
}

class DictionaryRuns extends Dictionary {
  void addRun() {
    printWrapper(() {
      super.add(term: '김치', definition: '배추를 절여 양념을 한 한국 음식');
      super.get(term: '김치');
    }, "addRun");
  }

  void deleteRun() {
    printWrapper(() {
      super.delete(term: '김치');
      super.get(term: '김치');
    }, "deleteRun");
  }

  void updateRun() {
    printWrapper(() {
      super.add(term: '깍두기', definition: '무를 절여 양념을 한 한국 음식');
      super.get(term: '깍두기');
      super.update(term: '깍두기', definition: '무무무 마마무');
      super.get(term: '깍두기');
    }, "updateRun");
  }

  void showAllRun() {
    printWrapper(() {
      super.add(term: '김치', definition: '배추를 절여 양념을 한 한국 음식');
      super.add(term: '김치볶음밥', definition: '김치를 밥과 볶은 음식');
      super.showAll();
    }, "showAllRun");
  }

  void countRun() {
    printWrapper(() {
      print('│ 사전에 들어가있는 단어는 총 [${super.count()}] 개 입니다.');
    }, "countRun");
  }

  void upsertRun() {
    printWrapper(() {
      super.add(term: '김치', definition: '배추를 절여 양념을 한 한국 음식');
      super.upsert(term: '김치', definition: '김치는 김치다!');
      super.showAll();
    }, "upsertRun");
  }

  void bulkAddRun() {
    printWrapper(() {
      List<DictionaryInfo> data = [
        {
          DictionaryKey.term: "피카츄",
          DictionaryKey.definition: "노란색의 작고 귀여운 포켓몬",
        },
      ];

      data.add({
        DictionaryKey.term: "꼬부기",
        DictionaryKey.definition: "거북이를 닮은 작고 귀여운 포켓몬",
      });

      super.bulkAdd(dictionaryInfos: data);
      super.showAll();
    }, "bulkAddRun");
  }

  void bulkDeleteRun() {
    printWrapper(() {
      Set<String> terms = {"어니부기"};
      terms.add("피카츄");
      terms.add("꼬부기");
      super.bulkDelete(terms: terms);
      super.showAll();
    }, "bulkDeleteRun");
  }
}

void main() {
  var dictionaryRuns = DictionaryRuns();
  dictionaryRuns.addRun();
  dictionaryRuns.deleteRun();
  dictionaryRuns.updateRun();
  dictionaryRuns.showAllRun();
  dictionaryRuns.countRun();
  dictionaryRuns.upsertRun();
  dictionaryRuns.bulkAddRun();
  dictionaryRuns.bulkDeleteRun();
}
