library epubreadertest;

import 'dart:math';

import 'package:epubx/src/schema/opf/epub_metadata.dart';
import 'package:epubx/src/schema/opf/epub_metadata_contributor.dart';
import 'package:epubx/src/schema/opf/epub_metadata_creator.dart';
import 'package:epubx/src/schema/opf/epub_metadata_date.dart';
import 'package:epubx/src/schema/opf/epub_metadata_identifier.dart';
import 'package:epubx/src/schema/opf/epub_metadata_meta.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';

main() async {
  final int length = 10;
  final RandomString randomString = new RandomString(new Random(123788));
  final RandomDataGenerator generator =
      new RandomDataGenerator(new Random(123778), length);

  var reference = generator.randomEpubMetadata();
  EpubMetadata? testMetadata;
  setUp(() async {
    testMetadata = new EpubMetadata()
      ..Contributors = List.from(reference.Contributors as Iterable)
      ..Coverages = List.from(reference.Coverages as Iterable)
      ..Creators = List.from(reference.Creators as Iterable)
      ..Dates = List.from(reference.Dates as Iterable)
      ..Description = reference.Description
      ..Formats = List.from(reference.Formats as Iterable)
      ..Identifiers = List.from(reference.Identifiers as Iterable)
      ..Languages = List.from(reference.Languages as Iterable)
      ..MetaItems = List.from(reference.MetaItems as Iterable)
      ..Publishers = List.from(reference.Publishers as Iterable)
      ..Relations = List.from(reference.Relations as Iterable)
      ..Rights = List.from(reference.Rights as Iterable)
      ..Sources = List.from(reference.Sources as Iterable)
      ..Subjects = List.from(reference.Subjects as Iterable)
      ..Titles = List.from(reference.Titles as Iterable)
      ..Types = List.from(reference.Types as Iterable);
  });
  tearDown(() async {
    testMetadata = null;
  });

  group("EpubMetadata", () {
    group(".equals", () {
      test("is true for equivalent objects", () async {
        expect(testMetadata, equals(reference));
      });
      test("is false when Contributors changes", () async {
        testMetadata!.Contributors = [new EpubMetadataContributor()];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Coverages changes", () async {
        testMetadata!.Coverages = [randomString.randomAlpha(length)];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Creators changes", () async {
        testMetadata!.Creators = [new EpubMetadataCreator()];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Dates changes", () async {
        testMetadata!.Dates = [new EpubMetadataDate()];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Description changes", () async {
        testMetadata!.Description = randomString.randomAlpha(length);
        expect(testMetadata, isNot(reference));
      });
      test("is false when Formats changes", () async {
        testMetadata!.Formats = [randomString.randomAlpha(length)];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Identifiers changes", () async {
        testMetadata!.Identifiers = [new EpubMetadataIdentifier()];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Languages changes", () async {
        testMetadata!.Languages = [randomString.randomAlpha(length)];
        expect(testMetadata, isNot(reference));
      });
      test("is false when MetaItems changes", () async {
        testMetadata!.MetaItems = [new EpubMetadataMeta()];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Publishers changes", () async {
        testMetadata!.Publishers = [randomString.randomAlpha(length)];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Relations changes", () async {
        testMetadata!.Relations = [randomString.randomAlpha(length)];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Rights changes", () async {
        testMetadata!.Rights = [randomString.randomAlpha(length)];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Sources changes", () async {
        testMetadata!.Sources = [randomString.randomAlpha(length)];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Subjects changes", () async {
        testMetadata!.Subjects = [randomString.randomAlpha(length)];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Titles changes", () async {
        testMetadata!.Titles = [randomString.randomAlpha(length)];
        expect(testMetadata, isNot(reference));
      });
      test("is false when Types changes", () async {
        testMetadata!.Types = [randomString.randomAlpha(length)];
        expect(testMetadata, isNot(reference));
      });
    });

    group(".hashCode", () {
      test("is true for equivalent objects", () async {
        expect(testMetadata.hashCode, equals(reference.hashCode));
      });
      test("is false when Contributors changes", () async {
        testMetadata!.Contributors = [new EpubMetadataContributor()];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Coverages changes", () async {
        testMetadata!.Coverages = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Creators changes", () async {
        testMetadata!.Creators = [new EpubMetadataCreator()];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Dates changes", () async {
        testMetadata!.Dates = [new EpubMetadataDate()];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Description changes", () async {
        testMetadata!.Description = randomString.randomAlpha(length);
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Formats changes", () async {
        testMetadata!.Formats = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Identifiers changes", () async {
        testMetadata!.Identifiers = [new EpubMetadataIdentifier()];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Languages changes", () async {
        testMetadata!.Languages = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when MetaItems changes", () async {
        testMetadata!.MetaItems = [new EpubMetadataMeta()];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Publishers changes", () async {
        testMetadata!.Publishers = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Relations changes", () async {
        testMetadata!.Relations = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Rights changes", () async {
        testMetadata!.Rights = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Sources changes", () async {
        testMetadata!.Sources = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Subjects changes", () async {
        testMetadata!.Subjects = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Titles changes", () async {
        testMetadata!.Titles = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
      test("is false when Types changes", () async {
        testMetadata!.Types = [randomString.randomAlpha(length)];
        expect(testMetadata.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
